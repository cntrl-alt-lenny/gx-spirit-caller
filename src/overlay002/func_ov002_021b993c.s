; func_ov002_021b993c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf184
        .global func_ov002_021b993c
        .arm
func_ov002_021b993c:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r3, r0, r2
    ldr r2, _LIT1
    mov r0, #0x0
    ldr r2, [r2, r3]
    cmp r2, #0x0
    bls .L_dc
    ldr r2, _LIT2
    add r2, r2, r3
    add lr, r2, #0x3a0
    ldr r2, [r2, #0x18]
.L_ac:
    ldr ip, [lr]
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp r1, r3
    ldmeqia sp!, {r3, pc}
    add r0, r0, #0x1
    cmp r0, r2
    add lr, lr, #0x4
    bcc .L_ac
.L_dc:
    mvn r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf184
_LIT2: .word data_ov002_022cf16c
