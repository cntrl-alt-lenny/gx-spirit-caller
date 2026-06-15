; func_02098c98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_02092940
        .extern func_020945f4
        .global func_02098c98
        .arm
func_02098c98:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, [r0, #0x8]
    ldr r1, [r0, #0xc]
    ldr r6, [r0, #0x4]
    add r4, r5, r1
    mov r0, r6
    mov r1, r4
    bl func_02092940
    mov r0, r6
    mov r1, r4
    bl func_020928cc
    add r0, r6, r5
    sub r2, r4, r5
    mov r1, #0x0
    bl func_020945f4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
