struct Slot { char pad[0x30]; unsigned int id : 13; };
extern char data_ov002_022cf16c[];
/* The existing C definition omits the id forwarded to func_0202e8ec(int). */
extern int func_0202eab0(int id);
extern int func_0202f620(int id, int *out);
extern int func_ov002_021ba294(int player, int arg1);
extern int func_ov002_021c3b60(int player, int arg1);

int func_ov002_0228dbe4(int player, int idx) {
    int out[2];
    int id = ((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14))->id;
    int last;
    if (func_0202eab0(id) != 0) {
        last = func_0202f620(id, out) - 1;
        if (id < out[last]) {
            if (func_ov002_021c3b60(player, out[last]) >= 0 || func_ov002_021ba294(player, out[last]) >= 0)
                return out[last];
        }
    }
    return 0;
}


