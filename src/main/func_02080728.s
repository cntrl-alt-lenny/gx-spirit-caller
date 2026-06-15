; func_02080728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020beedc
        .extern func_020808b8
        .extern func_020808f0
        .extern func_02080cdc
        .extern func_02080d38
        .global func_02080728
        .arm
func_02080728:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    cmp r2, #0x8
    movlt r4, r2
    movge ip, #0x3
    clzlt r4, r4
    rsblt ip, r4, #0x1f
    cmp r3, #0x8
    movlt r4, r3
    movge r6, #0x3
    clzlt r4, r4
    rsblt r6, r4, #0x1f
    ldr r4, _LIT0
    ldr r5, [sp, #0x28]
    add r4, r4, r6, lsl #0x3
    ldrb r6, [r4, ip, lsl #0x1]
    add ip, r4, ip, lsl #0x1
    ldr r4, _LIT1
    strb r6, [sp, #0x14]
    ldrb r6, [ip, #0x1]
    ldr lr, _LIT2
    ldr ip, _LIT3
    strb r6, [sp, #0x15]
    str r5, [sp]
    str r4, [sp, #0x4]
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    ldr ip, [sp, #0x14]
    str ip, [sp, #0x10]
    bl func_020808b8
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020beedc
_LIT1: .word func_02080d38
_LIT2: .word func_02080cdc
_LIT3: .word func_020808f0
