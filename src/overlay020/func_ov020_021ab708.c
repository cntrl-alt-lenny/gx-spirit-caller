/* func_ov020_021ab708: same shape as func_ov018_021aa880 / func_ov010_021b34dc
 * -- build two sprite handles via func_0201edac / func_0201ede4 (indexed by
 * a0 into two 16-byte-stride tables), blit each through func_0207f610 /
 * func_0207f510, then invoke both tasks.
 */

extern int func_0201edac(int *out, int cfg);
extern int func_0201ede4(int *out, int cfg);
extern void func_0207f610(int s, int b, int c, void *d);
extern void func_0207f510(int s, int b, int c, void *d);
extern void Task_Invoke(int h);

typedef struct {
    int field0;
    char _pad[0xc];
} Ov020Entry;

extern Ov020Entry data_ov020_021adf9c[];
extern Ov020Entry data_ov020_021adfa0[];
extern char data_ov020_021ae084[];
extern char data_ov020_021ae070[];

void func_ov020_021ab708(int a0, int a1, int a2, int a3) {
    int s1;
    int s0;
    int h1;
    int h2;
    h1 = func_0201edac(&s1, data_ov020_021adf9c[a0].field0);
    func_0207f610(s1, a2, a1, data_ov020_021ae084);
    Task_Invoke(h1);
    h2 = func_0201ede4(&s0, data_ov020_021adfa0[a0].field0);
    func_0207f510(s0, a3, a1, data_ov020_021ae070);
    Task_Invoke(h2);
}
