/* func_ov002_02251c18: guard chain forwarding to func_ov002_02253370(a,0xb,c). */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf08c[];
extern int func_0202b83c(int a);
extern int func_ov002_021b9048(int a, int b);
extern int func_ov002_021ca360(int player, int id);
extern void func_ov002_02253370(int a, int b, int c);

void func_ov002_02251c18(int arg0, int arg1, int arg2) {
    int player = arg0 & 1;
    struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf08c + player * 0x868 + 0x120);
    unsigned int id13 = row[arg2].id;
    int normalized;
    normalized = func_0202b83c(arg1);
    if (func_ov002_021b9048(id13, normalized) == 0) return;
    if (func_ov002_021ca360(arg0, id13) == 0) return;
    func_ov002_02253370(arg0, 0xb, arg2);
}
