/* func_ov020_021ab628: same shape as func_ov018_021aa7a0 / func_ov010_021b33dc
 * -- build two sprite handles via func_0201ed58 / func_0201ed90 (indexed by
 * a0 into two 16-byte-stride tables), blit each through func_0207f528 /
 * func_0207f428, then invoke both tasks.
 */

extern int func_0201ed58(int *out, int cfg);
extern int func_0201ed90(int *out, int cfg);
extern void func_0207f528(int s, int b, int c, void *d);
extern void func_0207f428(int s, int b, int c, void *d);
extern void Task_Invoke(int h);

typedef struct {
    int field0;
    char _pad[0xc];
} Ov020Entry;

extern Ov020Entry data_ov020_021adebc[];
extern Ov020Entry data_ov020_021adec0[];
extern char data_ov020_021adfa4[];
extern char data_ov020_021adf90[];

void func_ov020_021ab628(int a0, int a1, int a2, int a3) {
    int s1;
    int s0;
    int h1;
    int h2;
    h1 = func_0201ed58(&s1, data_ov020_021adebc[a0].field0);
    func_0207f528(s1, a2, a1, data_ov020_021adfa4);
    Task_Invoke(h1);
    h2 = func_0201ed90(&s0, data_ov020_021adec0[a0].field0);
    func_0207f428(s0, a3, a1, data_ov020_021adf90);
    Task_Invoke(h2);
}
