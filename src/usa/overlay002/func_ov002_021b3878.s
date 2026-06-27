; func_ov002_021b3878 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .global func_ov002_021b3878
        .arm
func_ov002_021b3878:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    mov r3, #0x14
    ldr ip, _LIT1
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r0, lr, r2, ip
    ldrh r3, [r3, r0]
    cmp r3, #0x0
    beq .L_860
    ldr r1, _LIT2
.L_838:
    add r2, r1, r3, lsl #0x3
    ldrh r0, [r2, #0x2]
    ldrh r3, [r2, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xd
    ldreqh r0, [r2]
    ldmeqia sp!, {r3, pc}
    cmp r3, #0x0
    bne .L_838
.L_860:
    ldr r0, _LIT3
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022d0570
_LIT3: .word 0x0000ffff
