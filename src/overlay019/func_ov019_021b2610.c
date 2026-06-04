/* func_ov019_021b2610: per-frame update for the two paired scenes. Advance each
 * scene's logic (func_ov019_021b3488 / func_ov019_021b4c30, keeping their
 * "done" flags), run their post-pass (func_ov019_021b3068 / func_ov019_021b4a4c),
 * flush both BG/OBJ layers, and report done only when BOTH scenes are.
 */

extern int func_ov019_021b3488(void *a);
extern int func_ov019_021b4c30(void *a);
extern void func_ov019_021b3068(void *a);
extern void func_ov019_021b4a4c(void *a);
extern void func_02005e20(int a);
extern void func_02005ca0(int a);
extern char data_ov019_021b5e70[];
extern char data_ov019_021b6848[];

int func_ov019_021b2610(void) {
    int a = func_ov019_021b3488(data_ov019_021b5e70);
    int b = func_ov019_021b4c30(data_ov019_021b6848);
    func_ov019_021b3068(data_ov019_021b5e70);
    func_ov019_021b4a4c(data_ov019_021b6848);
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    return a & b;
}
