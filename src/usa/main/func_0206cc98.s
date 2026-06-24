; func_0206cc98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bde0
        .extern func_0206bf20
        .extern func_0206cc88
        .global func_0206cc98
        .arm
func_0206cc98:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x64]
    ldrh r0, [r1, #0xfc]
    ldr r1, [r1, #0xf8]
    cmp r1, r0
    movlt r0, #0x0
    ldmltia sp!, {r4, lr}
    bxlt lr
    ldr r0, _LIT0
    mov r1, r4
    mov r2, #0x0
    bl func_0206bf20
    movs r1, r0
    mvneq r0, #0x20
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r0, r4
    bl func_0206bde0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206cc88
