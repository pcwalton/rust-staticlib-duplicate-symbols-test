#[no_mangle]
pub extern "C" fn b_fn() {
    a::bar()
}
