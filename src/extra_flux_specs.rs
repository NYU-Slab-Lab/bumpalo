extern crate flux_core;
use flux_rs::{extern_spec, spec};

flux_rs::defs! {
    use crate::pow2;
    use flux_core::ptr::aligned_to;
    use flux_core::ptr::valid;
}

#[extern_spec(core::ptr)]
impl<T> core::ptr::NonNull<T> {
    // TODO: this is broken because we need T : Sized for this spec
    // ideally we want a way to do this conditionally in the spec
    #[spec(fn(&mut NonNull<T>[@b, @a, @s]) -> &mut T requires a >= b && s >= T::size_of() && a % T::align_of() == 0)]
    unsafe fn as_mut<'a>(&mut self) -> &'a mut T;
}

#[extern_spec(core::num)]
impl usize {
    #[flux_rs::no_panic]
    #[spec(fn(n: usize) -> bool[n > 0 && pow2(n)])]
    const fn is_power_of_two(self) -> bool;
}

#[extern_spec(crate::core_alloc::alloc)]
#[spec(fn(
    Layout[@size, @align]
) -> *mut{p:
    p.addr == 0 ||
    (p.addr == p.base && p.size == size && aligned_to(p, align)
        && p.addr >= 0) // needed for some reason
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
