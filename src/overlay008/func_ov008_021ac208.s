; func_ov008_021ac208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov008_021b2790
        .extern data_ov008_021b2dc0
        .extern func_02006164
        .extern func_ov008_021aa578
        .extern func_ov008_021b1e0c
        .extern func_ov008_021b1e20
        .extern func_ov008_021b1ee0
        .extern func_ov008_021b2028
        .global func_ov008_021ac208
        .arm
func_ov008_021ac208:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r0, #0x34
    ldrh r2, [r1, #0x4]
    ldr r4, _LIT1
    mov r5, #0x0
    mov r1, r2, lsl #0x10
    mov r2, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, r2, lsr #0x18
    mul r6, r1, r0
    add r0, r4, r6
    ldr r0, [r0, #0x4]
    bl func_ov008_021b1e0c
    ldrh r0, [r4, r6]
    mov r1, r5
    bl func_ov008_021b1e20
    bl func_ov008_021b1ee0
    cmp r0, #0x0
    beq .L_1dc
    mov r0, #0xe3
    mov r1, r5
    mov r2, #0x100
    mov r3, #0x14
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_1cc
    bl func_02006164
    cmp r0, #0x0
    movne r5, #0x1
    b .L_1dc
.L_1cc:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    movne r5, #0x1
.L_1dc:
    mov r0, r5
    bl func_ov008_021b2028
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2dc0
_LIT1: .word data_ov008_021b2790
_LIT2: .word data_02104bac
