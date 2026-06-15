; func_0202695c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200f044
        .extern func_0200f13c
        .extern func_0200f2ac
        .extern func_0200f4b4
        .extern func_0200f684
        .global func_0202695c
        .arm
func_0202695c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r3
    cmp r1, #0x0
    and r5, r2, #0x1
    ldr r4, [r7, #0xa4]
    beq .L_9a4
    cmp r1, #0x1
    cmpne r1, #0x2
    beq .L_aac
    b .L_b4c
.L_9a4:
    ldrb r0, [r7, #0xab]
    tst r0, #0x1
    beq .L_9d8
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f044
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f044
.L_9d8:
    ldrb r0, [r7, #0xab]
    tst r0, #0x2
    beq .L_a0c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f2ac
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f2ac
.L_a0c:
    ldrb r0, [r7, #0xab]
    tst r0, #0x4
    beq .L_a40
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f13c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f13c
.L_a40:
    ldrb r0, [r7, #0xab]
    tst r0, #0x8
    beq .L_a74
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f4b4
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f4b4
.L_a74:
    ldrb r0, [r7, #0xab]
    tst r0, #0x10
    beq .L_b4c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f684
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f684
    b .L_b4c
.L_aac:
    ldrb r0, [r7, #0xab]
    tst r0, #0x1
    beq .L_acc
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f044
.L_acc:
    ldrb r0, [r7, #0xab]
    tst r0, #0x2
    beq .L_aec
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f2ac
.L_aec:
    ldrb r0, [r7, #0xab]
    tst r0, #0x4
    beq .L_b0c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f13c
.L_b0c:
    ldrb r0, [r7, #0xab]
    tst r0, #0x8
    beq .L_b2c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f4b4
.L_b2c:
    ldrb r0, [r7, #0xab]
    tst r0, #0x10
    beq .L_b4c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f684
.L_b4c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
