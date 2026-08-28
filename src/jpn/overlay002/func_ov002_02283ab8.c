/* func_ov002_02283ab8: fixed 5-slot scan (idx 0..4), skipping idx==arg1.
 * For each remaining slot with a nonzero id (row+0x30's Ov002Slot array),
 * optionally gated by func_ov002_021be3c0(player,idx,1) when arg2!=0, track
 * the running max of data_ov002_022cd444[player][idx].val (+0x28 field,
 * 0x2c-byte stride, 0xdc-byte per-player stride). */
struct Slot13 { unsigned int id : 13; char pad[16]; };
struct CdEntry { char pad[0x28]; int val; };

extern char data_ov002_022cf08c[];
extern char data_ov002_022cd444[];
extern int func_ov002_021be3c0(int player, int idx, int one);

int func_ov002_02283ab8(int player, int arg1, int arg2) {
    char *row = data_ov002_022cf08c + (player & 1) * 0x868;
    struct Slot13 *slotArr = (struct Slot13 *)(row + 0x30);
    struct CdEntry *cdArr = (struct CdEntry *)(data_ov002_022cd444 + player * 0xdc);
    int idx;
    int max = -1;

    for (idx = 0; idx <= 4; idx++) {
        if (idx == arg1)
            continue;
        if (slotArr[idx].id == 0)
            continue;
        if (arg2 != 0) {
            if (func_ov002_021be3c0(player, idx, 1) == 0)
                continue;
        }
        if (cdArr[idx].val > max)
            max = cdArr[idx].val;
    }
    return max;
}
