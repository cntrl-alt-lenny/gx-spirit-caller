; func_02080714 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207ffd0
        .extern func_0208002c
        .global func_02080714
        .arm
func_02080714:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r7, r1
    ldrh r1, [sp, #0x2c]
    mov r8, r0
    mov r0, r7
    mov r6, r2
    mov r5, r3
    bl func_0208002c
    ldr r1, _LIT0
    mov r4, r0
    cmp r4, r1
    ldreq r0, [r7]
    ldreqh r4, [r0, #0x2]
    mov r0, r7
    mov r1, r4
    bl func_0207ffd0
    str r0, [sp, #0x8]
    ldr r0, [r7]
    ldr r2, [sp, #0x28]
    ldr r0, [r0, #0x8]
    add r1, sp, #0x8
    ldrh r3, [r0, #0x2]
    add ip, r0, #0x8
    mov r0, r8
    mla r3, r4, r3, ip
    str r3, [sp, #0xc]
    str r2, [sp]
    str r1, [sp, #0x4]
    ldr r1, [sp, #0x8]
    ldr r4, [r8, #0x14]
    ldrsb r2, [r1]
    mov r1, r7
    mov r3, r5
    add r2, r6, r2
    blx r4
    ldrh r0, [r7, #0x8]
    cmp r0, #0x0
    ldrne r0, [sp, #0x8]
    ldrnesb r1, [r0]
    ldrneb r0, [r0, #0x1]
    addne r0, r1, r0
    ldreq r0, [sp, #0x8]
    ldreqsb r0, [r0, #0x2]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x0000ffff
