; func_ov002_0222d2f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021de408
        .extern func_ov002_021efac8
        .extern func_ov002_02257704
        .extern func_ov002_02257750
        .extern func_ov002_0226b22c
        .global func_ov002_0222d2f8
        .arm
func_ov002_0222d2f8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_110
    cmp r1, #0x80
    bne .L_158
    ldrh r0, [r4, #0x2]
    mov r2, #0x3
    mov r3, #0x1
    mov r1, r0, lsl #0x1a
    mov ip, r0, lsl #0x1f
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b22c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_110:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x3
    bne .L_134
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
    b .L_150
.L_134:
    cmp r1, #0x0
    bne .L_150
    ldr r1, _LIT2
    bl func_ov002_02257750
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word func_ov002_021efac8
