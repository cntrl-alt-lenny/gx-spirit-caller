; func_0206e050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebf8
        .extern data_0219ec00
        .extern data_0219ec0c
        .extern data_0219ee3c
        .extern func_0206bf9c
        .extern func_0206df1c
        .extern func_02073fdc
        .extern func_0207403c
        .extern func_02091680
        .global func_0206e050
        .arm
func_0206e050:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, [r1]
    cmp r0, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0]
    streq r0, [r1]
    bl func_0206df1c
    mvn r4, #0x19
    cmp r0, r4
    bne .L_fc
    mov r5, #0x64
.L_e8:
    mov r0, r5
    bl func_02091680
    bl func_0206df1c
    cmp r0, r4
    beq .L_e8
.L_fc:
    bl func_0206bf9c
    movs r4, r0
    bmi .L_144
    bl func_02073fdc
    mov r0, #0x0
    bl func_0207403c
    ldr r0, _LIT2
    ldr r1, [r0]
    ldr r0, [r1, #0x28]
    cmp r0, #0x0
    bne .L_138
    ldr r0, _LIT3
    ldr r1, [r1, #0x1c]
    ldr r0, [r0, #0x1c]
    blx r1
.L_138:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
.L_144:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ec00
_LIT1: .word data_0219ee3c
_LIT2: .word data_0219ebf8
_LIT3: .word data_0219ec0c
