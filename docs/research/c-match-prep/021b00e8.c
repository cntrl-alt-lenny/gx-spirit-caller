/* CAMPAIGN-PREP candidate for func_021b00e8 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch (jump-table) + (key&1)*stride index loads
 *   risk:       mwcc must emit mul-by-0x868 (not shift+add) and the addls jump-table form; case-body order should follow source ascending.
 *   confidence: med
 */
/* func_ov002_021b00e8: switch(sel) over cases 12..15, each returning
 * *(int*)((char*)tableN + (key & 1) * 0x868); default returns 0.
 *   case 12 -> data_022cf184
 *   case 13 -> data_022cf17c
 *   case 14 -> data_022cf180
 *   case 15 -> data_022cf188
 *
 *     sub r1,r1,#0xc; cmp r1,#3; addls pc,pc,r1,lsl#2 ; b default
 *     each: and r0,r0,#1; mul r1,r0,#0x868; ldr r0,=tableN; ldr r0,[r0,r1]; bx lr
 */

extern char data_ov002_022cf17c[];
extern char data_ov002_022cf180[];
extern char data_ov002_022cf184[];
extern char data_ov002_022cf188[];

int func_ov002_021b00e8(int key, int sel) {
    switch (sel) {
    case 12: return *(int *)(data_ov002_022cf184 + (key & 1) * 0x868);
    case 13: return *(int *)(data_ov002_022cf17c + (key & 1) * 0x868);
    case 14: return *(int *)(data_ov002_022cf180 + (key & 1) * 0x868);
    case 15: return *(int *)(data_ov002_022cf188 + (key & 1) * 0x868);
    default: return 0;
    }
}
