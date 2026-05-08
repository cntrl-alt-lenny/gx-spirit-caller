/* func_02054d9c: twin of func_02054cf8 with func_0206ea84 as
 * source. sp3.
 */

extern int func_0206ea84(void);
extern int func_02054ea8(int x, int y);

int func_02054d9c(void) {
    return func_02054ea8(func_0206ea84(), -1);
}
