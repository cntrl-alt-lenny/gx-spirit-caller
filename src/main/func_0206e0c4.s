; func_0206e0c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ecd8
        .extern data_0219ece0
        .extern data_0219ecec
        .extern data_0219ef1c
        .extern func_0206c010
        .extern func_0206df90
        .extern func_020740c4
        .extern func_02074124
        .extern func_02091768
        .global func_0206e0c4
        .arm
func_0206e0c4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, [r1]
    cmp r0, #0x0
    ldreq r0, _LIT1
    ldreq r0, [r0]
    streq r0, [r1]
    bl func_0206df90
    mvn r4, #0x19
    cmp r0, r4
    bne .L_94c
    mov r5, #0x64
.L_938:
    mov r0, r5
    bl func_02091768
    bl func_0206df90
    cmp r0, r4
    beq .L_938
.L_94c:
    bl func_0206c010
    movs r4, r0
    bmi .L_994
    bl func_020740c4
    mov r0, #0x0
    bl func_02074124
    ldr r0, _LIT2
    ldr r1, [r0]
    ldr r0, [r1, #0x28]
    cmp r0, #0x0
    bne .L_988
    ldr r0, _LIT3
    ldr r1, [r1, #0x1c]
    ldr r0, [r0, #0x1c]
    blx r1
.L_988:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
.L_994:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ece0
_LIT1: .word data_0219ef1c
_LIT2: .word data_0219ecd8
_LIT3: .word data_0219ecec
