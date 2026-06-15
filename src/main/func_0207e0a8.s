; func_0207e0a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102120
        .extern data_021a08e0
        .global func_0207e0a8
        .arm
func_0207e0a8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r6, #0x0
    ldrh r7, [r0]
    ldr r5, _LIT1
    mov lr, r6
    cmp r7, #0x1
    addhi r7, r7, #0x1
    mov r1, r6
    mov r3, r6
    mov r4, #0x1
    mov r0, #0x20000
    mov r2, #0x10000
.L_1c0:
    cmp r6, r7
    strlt r4, [r5, #0x8]
    strge lr, [r5, #0x8]
    ldr ip, [r5, #0xc]
    add r6, r6, #0x1
    cmp ip, #0x0
    strne r3, [r5]
    strne r2, [r5, #0x4]
    streq r1, [r5]
    streq r0, [r5, #0x4]
    cmp r6, #0x5
    add r5, r5, #0x18
    blt .L_1c0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a08e0
_LIT1: .word data_02102120
