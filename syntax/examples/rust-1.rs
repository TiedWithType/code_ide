/* outer /* nested */ still */
async fn run<'a>(x: &'a str) {
    let raw = r##"a "quote" # b"##;
    println!("{}", 42_u32);
}
