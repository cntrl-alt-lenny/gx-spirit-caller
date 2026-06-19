/* func_ov019_021b2510: per-frame update for the two paired scenes. Advance each
 * scene's logic (func_ov019_021b3388 / func_ov019_021b4b1c, keeping their
 * "done" flags), run their post-pass (func_ov019_021b2f68 / func_ov019_021b4938),
 * flush both BG/OBJ layers, and report done only when BOTH scenes are.
 */

extern int func_ov019_021b3388(void *a);
extern int func_ov019_021b4b1c(void *a);
extern void func_ov019_021b2f68(void *a);
extern void func_ov019_021b4938(void *a);
extern void func_02005e04(int a);
extern void func_02005c84(int a);
extern char data_ov019_021b5d70[];
extern char data_ov019_021b6748[];

int func_ov019_021b2510(void) {
    int a = func_ov019_021b3388(data_ov019_021b5d70);
    int b = func_ov019_021b4b1c(data_ov019_021b6748);
    func_ov019_021b2f68(data_ov019_021b5d70);
    func_ov019_021b4938(data_ov019_021b6748);
    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    return a & b;
}
