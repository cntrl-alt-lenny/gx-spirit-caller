; func_ov002_021b9fd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4108
        .extern func_ov002_021bd77c
        .global func_ov002_021b9fd0
        .arm
func_ov002_021b9fd0:
    stmdb sp!, {r4, lr}
    ldr r2, [r0]
    ldr r1, _LIT0
    mov r2, r2, lsl #0x13
    mov r4, r2, lsr #0x13
    cmp r4, r1
    bne .L_22c
    mov r1, r4
    bl func_ov002_021b4108
    mov r4, r0
    mvn r1, #0x0
    cmp r4, r1
    beq .L_224
    bl func_ov002_021bd77c
    cmp r0, #0x0
    beq .L_22c
.L_224:
    ldr r0, _LIT0
    ldmia sp!, {r4, pc}
.L_22c:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001a74
