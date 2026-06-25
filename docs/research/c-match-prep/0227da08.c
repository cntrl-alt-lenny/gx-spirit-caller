/* CAMPAIGN-PREP candidate for func_0227da08 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD :13 id + counted loop, strh store, -1 guard, return 1
 *   risk:       stack buf size/offset (sp+4) and the str &buf,[sp] 5th-arg pass may differ; loop reg-alloc (r5-r9,sl) could flip
 *   confidence: low
 */
/* func_ov002_0227da08: extract 13-bit id from data_022d0250[arg1*4] (u16,
 * lsl#19;lsr#19); n = func_0227d8c4(); for i in [0,n): build via func_0227d6f8
 * into a stack[i]; if it returns -1, bail return 0; else store low16; return 1.
 *
 *   r9=arg0 r8=arg2; r4=arg1<<2; ldrh r3,[data_022d0250,r4]; r5=id13
 *   bl 0227d8c4; r6=n; ble .end
 *   loop: r0=arg0 r1=id13 r2=arg2 r3=i; str &buf,[sp]; bl 0227d6f8
 *         cmp r0,-1 -> eq: ret 0
 *         strh r0,[buf, i*2]; i++; cmp i,n; blt
 *   end: mov r0,#1; pop
 */
typedef unsigned short u16;
extern u16 data_ov002_022d0250[];
extern int func_ov002_0227d8c4(void);
extern int func_ov002_0227d6f8(int a, int id, int c, int i, u16 *out);

int func_ov002_0227da08(int arg0, int arg1, int arg2) {
    u16 buf[4];
    struct S13 { u16 id : 13; };
    int id = ((struct S13 *)&data_ov002_022d0250[arg1 * 2])->id;
    int n = func_ov002_0227d8c4();
    int i;
    for (i = 0; i < n; i++) {
        int r = func_ov002_0227d6f8(arg0, id, arg2, i, buf);
        if (r == -1)
            return 0;
        buf[i] = (u16)r;
    }
    return 1;
}
