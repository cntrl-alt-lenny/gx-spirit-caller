; func_02018e0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020191dc
        .global func_02018e0c
        .arm
func_02018e0c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    bl GetSystemWork
    mov r5, r0
    mov r0, r6
    bl func_020191dc
    mov r1, #0x10000
    sub r2, r0, #0x1
    mov r0, #0x18
    mla r3, r2, r0, r5
    ldr r0, [r3, #0xc]
    rsb r1, r1, #0x0
    and r1, r0, r1
    mov r0, r4, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r3, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
