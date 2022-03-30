#[no_mangle]
pub extern "C" fn baz() {
    a::foo()
}