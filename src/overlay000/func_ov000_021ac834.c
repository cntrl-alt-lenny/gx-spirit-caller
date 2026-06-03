/* func_ov000_021ac834: 1 if the two signed 4-bit fields packed into the low
 * byte of config word +4 differ, else 0. (021af378 predicate family.) */
extern char data_ov000_021c758c[];
struct Ov000Cfg4 {
    int w0;
    int lo : 4;
    int hi : 4;
};
int func_ov000_021ac834(void) {
    struct Ov000Cfg4 *p = (struct Ov000Cfg4 *)data_ov000_021c758c;
    return p->lo != p->hi;
}
