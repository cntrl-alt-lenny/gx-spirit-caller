/* func_ov002_021b3e94: recovered C-42 resister (brief 254), sibling of
 * 021b3e5c — same 2-D table (base data_ov002_022cf1a6, stride 0x868),
 * tail helper func_021b3dd0.
 *
 *     push  {r4, lr}
 *     ldr   ip, .L (0x868) ; mov lr, #0x14 ; mul lr, r1, lr
 *     ldr   r1, .L (data_ov002_022cf1a6)
 *     and   r4, r0, #0x1 ; mla r0, r4, ip, r1
 *     mov   r1, r2 ; ldrh r0, [lr, r0] ; mov r2, r3
 *     bl    func_ov002_021b3dd0 ; pop {r4, pc}
 */

typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern int func_ov002_021b3dd0(u16 val, int a2, int a3);

int func_ov002_021b3e94(int arg0, int arg1, int a2, int a3) {
    u16 val = *(u16 *)(data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20);
    return func_ov002_021b3dd0(val, a2, a3);
}
