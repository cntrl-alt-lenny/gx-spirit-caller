; func_ov005_021ac9d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .global func_ov005_021ac9d4
        .arm
func_ov005_021ac9d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh ip, [r4, #0x5c]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    bic ip, ip, #0x30
    mov r0, r0, lsl #0x1e
    orr r0, ip, r0, lsr #0x1a
    strh r0, [r4, #0x5c]
    str r2, [r4, #0x40]
    ldr r0, [sp, #0x8]
    str r3, [r4, #0x44]
    str r0, [r4, #0x48]
    ldrh r0, [r4, #0x16]
    mov r3, #0x60
    mov r2, #0x0
    mov ip, r0, lsl #0x3
    mov r0, ip, asr #0x3
    add r0, ip, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r0, r0, #0x2
    mul r3, r0, r3
    mul r0, r1, r3
    mov r1, #0x4
    bl Task_PostLocked
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
