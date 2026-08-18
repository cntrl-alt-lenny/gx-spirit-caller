/* func_ov010_021b34dc: same shape as func_ov018_021aa880 -- build two
 * sprite handles via func_0201edac / func_0201ede4, blit each through
 * func_0207f610 / func_0207f510, then invoke both tasks.
 */

extern int func_0201edac(int *out, int cfg);
extern int func_0201ede4(int *out, int cfg);
extern void func_0207f610(int s, int b, int c, void *d);
extern void func_0207f510(int s, int b, int c, void *d);
extern void Task_Invoke(int h);
extern int data_ov010_021b8a60[2];
extern char data_ov010_021b8ce4[];
extern char data_ov010_021b8cd0[];

void func_ov010_021b34dc(int a0, int a1, int a2) {
    int s1;
    int s0;
    int h1;
    int h2;
    h1 = func_0201edac(&s1, data_ov010_021b8a60[0]);
    func_0207f610(s1, a1, a0, data_ov010_021b8ce4);
    Task_Invoke(h1);
    h2 = func_0201ede4(&s0, data_ov010_021b8a60[1]);
    func_0207f510(s0, a2, a0, data_ov010_021b8cd0);
    Task_Invoke(h2);
}
