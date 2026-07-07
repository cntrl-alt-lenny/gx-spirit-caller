; func_ov002_021af8f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern data_ov002_022cdfa8
        .extern func_ov002_021afa10
        .extern func_ov002_022535a4
        .extern func_ov002_02280594
        .extern func_ov002_02280604
        .extern func_ov002_02280684
        .extern func_ov002_0228072c
        .extern func_ov002_0229acd0
        .extern func_ov002_0229cc4c
        .global func_ov002_021af8f0
        .arm
func_ov002_021af8f0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr ip, _LIT0
    mov r7, r0
    mov r6, r1
    str r7, [ip]
    ldr r0, _LIT1
    str r6, [ip, #0x4]
    mov lr, #0x0
    mov r1, #0x200
    mov r5, r2
    mov r4, r3
    str lr, [ip, #0x8]
    bl func_ov002_0229cc4c
    ldr r0, _LIT2
    mov r1, #0x100
    bl func_ov002_0229cc4c
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_022535a4
    cmp r6, #0x6
    blt .L_ec4
    ldr r0, _LIT3
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x1
    bne .L_ec4
    cmp r6, #0x6
    cmpne r6, #0x4a
    bne .L_e54
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_02280594
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e54:
    cmp r6, #0x6
    ble .L_e80
    cmp r6, #0x26
    bgt .L_e80
    bl func_ov002_021afa10
    mov r3, r0
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_02280604
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e80:
    cmp r6, #0x27
    ble .L_eac
    cmp r6, #0x48
    bgt .L_eac
    bl func_ov002_021afa10
    mov r3, r0
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_02280684
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_eac:
    cmp r6, #0x4b
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r5
    bl func_ov002_0228072c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ec4:
    mov r1, r7
    mov r2, r6
    mov r0, #0x32
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cdba8
_LIT2: .word data_ov002_022cdfa8
_LIT3: .word data_ov002_022cd664
