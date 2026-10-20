/* This caller passes a second argument beyond the current C definition. */
extern void func_ov002_02285984(int arg0, int a);
extern void func_ov002_022859b4(void *arg0, int a);
extern int func_ov002_02285a9c(int a, int b, int c, int n, void *entries);
extern void func_ov002_021c4c9c(int a, int b, int *out);
extern int func_ov002_021c84a8(int a, int b);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_0202b8f0(int unused0);
/* This caller supplies the card ID, omitted by the current C definition. */
extern int func_0202b920(int id);
extern char data_ov002_022cd300[];
extern char data_ov002_022ce288[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a8[];
void func_ov002_02286110(int a, int id, int n, void *entries, int *out)
{
    char buf[0xc8];
    int slot;
    func_ov002_02285984((int)buf, a);
    slot = func_ov002_02285a9c(a, id, 0, n, entries);
    if (slot >= 0) {
        if (*(unsigned short *)(data_ov002_022cd300 + 4) & 1) {
            switch (id) {
            case 0x18b4:
                *(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + slot * 0x14) = *(unsigned short *)(data_ov002_022cd300 + 0x10) * 0x2bc;
                break;
            case 0x18fb: {
                int value = *(int *)(data_ov002_022ce288 + 0x6a8);
                if (value > 0xffff) value = 0xffff;
                *(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + slot * 0x14) = value;
                break;
            }
            case 0x1a4e:
                *(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + slot * 0x14) = *(int *)(data_ov002_022ce288 + 0x6a4);
                break;
            }
        }
        func_ov002_021c4c9c(a, slot, out);
        *(unsigned short *)(data_ov002_022cf1a2 + (a & 1) * 0x868 + slot * 0x14) = 1;
        out[6] = func_ov002_021c84a8(a, slot);
    } else {
        out[0] = id;
        out[2] = func_0202b890(id);
        out[4] = func_0202b8a8(id);
        out[1] = func_0202b878(id);
        out[5] = func_0202b8f0(id);
        out[6] = func_0202b920(id);
    }
    func_ov002_022859b4(buf, a);
}

