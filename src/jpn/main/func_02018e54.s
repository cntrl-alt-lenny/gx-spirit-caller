; func_02018e54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020191dc
        .global func_02018e54
        .arm
func_02018e54:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl GetSystemWork
    mov r4, r0
    mov r0, r7
    bl func_020191dc
    sub r1, r0, #0x1
    mov r0, #0x18
    cmp r7, #0x0
    streq r6, [r4, #0x908]
    mla r0, r1, r0, r4
    streq r5, [r4, #0x90c]
    strne r6, [r0]
    strne r5, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
