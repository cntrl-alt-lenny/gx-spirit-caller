/* CAMPAIGN-PREP candidate for func_0207475c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + store-order byte fill + 5-arg stack call; field clear on exit
 *   risk:       7-byte init may lower to rodata memcpy instead of strb run; frame size 0x20 / arg-slot layout may differ
 *   confidence: med
 */
/* func_0207475c: when the sub-object's state byte (0x455) == 8, build a
 * 7-byte command record on the stack, hand it to func_02075df4 together
 * with the sub-object, then dispatch (record, result, 0, 0, owner) to
 * func_020705d4. The state byte is always cleared on exit.
 */
typedef struct Sub {
    unsigned char _pad[0x455];
    unsigned char state;          /* 0x455 */
} Sub;

typedef struct Owner {
    char _pad0[0xc];
    Sub *sub;                     /* 0xc */
} Owner;

extern int  func_02075df4(Sub *s, void *cmd);
extern void func_020705d4(void *cmd, int a, int b, int c, Owner *owner);

void func_0207475c(Owner *owner) {
    Sub *sub = owner->sub;
    if (sub->state == 8) {
        unsigned char cmd[7];
        int r;
        cmd[0] = 0x15;
        cmd[1] = 0x03;
        cmd[2] = 0x00;
        cmd[3] = 0x00;
        cmd[4] = 0x02;
        cmd[5] = 0x01;
        cmd[6] = 0x00;
        r = func_02075df4(sub, cmd);
        func_020705d4(cmd, r, 0, 0, owner);
    }
    sub->state = 0;
}
