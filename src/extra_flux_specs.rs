extern crate flux_core;
use flux_rs::{extern_spec, spec};

// Unused to rustc — `MetaSized` appears only in `spec` attributes.
#[cfg(flux)]
#[allow(unused_imports)]
use core::marker::MetaSized;

flux_rs::defs! {
    use crate::pow2;
    use flux_core::ptr::aligned_to;
    use flux_core::ptr::valid;
    use flux_core::num::max;
    use flux_core::num::min;
}

// flux-core specs the `Ord::min` method but not the free function `core::cmp::min`.
#[extern_spec(core::cmp)]
#[spec(fn(T[@a], T[@b]) -> T{v: <T as Ord>::min_res(a, b, v)})]
fn min<T: Ord>(v1: T, v2: T) -> T;

// flux-core specs the `Ord::max` method but not the free function `core::cmp::max`.
#[extern_spec(core::cmp)]
#[spec(fn(T[@a], T[@b]) -> T{v: <T as Ord>::max_res(a, b, v)})]
fn max<T: Ord>(v1: T, v2: T) -> T;

// flux-core has no `Ord` spec for `NonNull`, which compares addresses. As in std's `min_by` and
// `max_by`, ties go to the first argument for `min` and to the second for `max`.
#[extern_spec(core::ptr)]
#[flux_rs::assoc(
    fn min_res(a: NonNull, b: NonNull, res: NonNull) -> bool {
        if a.addr <= b.addr { res == a } else { res == b }
    }
    fn max_res(a: NonNull, b: NonNull, res: NonNull) -> bool {
        if a.addr > b.addr { res == a } else { res == b }
    }
)]
impl<T: ?Sized> Ord for core::ptr::NonNull<T> {}

// flux-core doesn't refine `Ordering` or `Ord::cmp`, so matching on `a.cmp(&b)` teaches flux
// nothing about `a` and `b`.
#[extern_spec(core::cmp)]
#[refined_by(ord: int)]
enum Ordering {
    #[variant(Ordering[-1])]
    Less,
    #[variant(Ordering[0])]
    Equal,
    #[variant(Ordering[1])]
    Greater,
}

// This replaces flux-core's spec for `impl Ord for usize` (a local extern spec shadows the upstream
// one), so it repeats flux-core's `min_res`/`max_res`, `min` and `max`, and adds `cmp`.
#[extern_spec(core::cmp)]
#[flux_rs::assoc(
    fn min_res(a: int, b: int, res: int) -> bool { res == min(a, b) }
    fn max_res(a: int, b: int, res: int) -> bool { res == max(a, b) }
)]
impl Ord for usize {
    #[spec(fn(&usize[@a], &usize[@b]) -> Ordering[if a < b { -1 } else if a == b { 0 } else { 1 }])]
    fn cmp(&self, other: &usize) -> Ordering;

    #[spec(fn(usize[@a], usize[@b]) -> usize[min(a, b)])]
    fn min(self, other: usize) -> usize;

    #[spec(fn(usize[@a], usize[@b]) -> usize[max(a, b)])]
    fn max(self, other: usize) -> usize;
}

#[extern_spec(core::num)]
impl usize {
    #[flux_rs::no_panic]
    #[spec(fn(n: usize) -> bool[n > 0 && pow2(n)])]
    const fn is_power_of_two(self) -> bool;

    // Overflow (`n > 2^63`) panics in debug builds and returns 0 in release builds.
    #[spec(fn(n: usize) -> usize{r: r >= n && pow2(r) && (n <= 1 || r < 2 * n)}
        requires n <= 9223372036854775808)]
    const fn next_power_of_two(self) -> usize;
}

#[extern_spec(crate::core_alloc::alloc)]
#[spec(fn(
    Layout[@size, @align]
) -> *mut{p:
    p.addr == 0 ||
    (p.addr == p.base && p.size == size && aligned_to(p, align))
} u8
    requires size > 0
)]
unsafe fn alloc(layout: Layout) -> *mut u8;

#[extern_spec(crate::core_alloc::alloc)]
#[spec(fn(
    ptr: *mut[@p] u8,
    Layout[@size, @align]
)
    requires size > 0 &&
             p.addr == p.base &&
             p.size == size &&
             valid(p, size) &&
             aligned_to(p, align)
)]
unsafe fn dealloc(ptr: *mut u8, layout: Layout);

// Same as flux-core's `NonNull::from_ref`/`from_mut`, for the `From` impls.
#[extern_spec(core::ptr)]
impl<'a, T: 'a> From<&'a T> for core::ptr::NonNull<T> {
    #[spec(fn(&T) -> NonNull<T>{p: p.base == p.addr && p.size == <T as MetaSized>::size_of_val(p.meta) && p.size >= 0
        && p.addr % <T as MetaSized>::align_of_val(p.meta) == 0})]
    fn from(r: &'a T) -> Self;
}

#[extern_spec(core::ptr)]
impl<'a, T: 'a> From<&'a mut T> for core::ptr::NonNull<T> {
    #[spec(fn(&mut T) -> NonNull<T>{p: p.base == p.addr && p.size == <T as MetaSized>::size_of_val(p.meta) && p.size >= 0
        && p.addr % <T as MetaSized>::align_of_val(p.meta) == 0})]
    fn from(r: &'a mut T) -> Self;
}
