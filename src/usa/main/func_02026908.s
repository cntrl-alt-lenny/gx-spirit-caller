; func_02026908 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200f028
        .extern func_0200f120
        .extern func_0200f290
        .extern func_0200f498
        .extern func_0200f668
        .global func_02026908
        .arm
func_02026908:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r3
    cmp r1, #0x0
    and r5, r2, #0x1
    ldr r4, [r7, #0xa4]
    beq .L_3a4
    cmp r1, #0x1
    cmpne r1, #0x2
    beq .L_4ac
    b .L_54c
.L_3a4:
    ldrb r0, [r7, #0xab]
    tst r0, #0x1
    beq .L_3d8
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f028
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f028
.L_3d8:
    ldrb r0, [r7, #0xab]
    tst r0, #0x2
    beq .L_40c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f290
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f290
.L_40c:
    ldrb r0, [r7, #0xab]
    tst r0, #0x4
    beq .L_440
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f120
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f120
.L_440:
    ldrb r0, [r7, #0xab]
    tst r0, #0x8
    beq .L_474
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f498
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f498
.L_474:
    ldrb r0, [r7, #0xab]
    tst r0, #0x10
    beq .L_54c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x6
    bl func_0200f668
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x1
    bl func_0200f668
    b .L_54c
.L_4ac:
    ldrb r0, [r7, #0xab]
    tst r0, #0x1
    beq .L_4cc
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f028
.L_4cc:
    ldrb r0, [r7, #0xab]
    tst r0, #0x2
    beq .L_4ec
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f290
.L_4ec:
    ldrb r0, [r7, #0xab]
    tst r0, #0x4
    beq .L_50c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f120
.L_50c:
    ldrb r0, [r7, #0xab]
    tst r0, #0x8
    beq .L_52c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f498
.L_52c:
    ldrb r0, [r7, #0xab]
    tst r0, #0x10
    beq .L_54c
    mov r0, r4
    mov r2, r6
    mov r3, r5
    mov r1, #0x5
    bl func_0200f668
.L_54c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
