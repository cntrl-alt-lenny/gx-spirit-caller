/* func_ov018_021aac84: if the pen was pressed this frame, raise the redraw
 * flag (bit 2 of +0x9b4 in the OAM mirror).
 *
 *     bl func_02006148; cmp r0,#0; ldmeqia sp!,{r4,pc}
 *     add r0,r4,#0x900; ldrh r1,[r0,#0xb4]; orr r1,#4; strh r1,[r0,#0xb4]
 */

extern char data_ov018_021ad7c8[];
extern int func_02006148(void);

void func_ov018_021aac84(void) {
    char *oam = data_ov018_021ad7c8;
    if (func_02006148() == 0) return;
    *(unsigned short *)(oam + 0x9b4) |= 4;
}
