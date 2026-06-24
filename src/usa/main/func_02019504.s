; func_02019504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020191dc
        .global func_02019504
        .arm
func_02019504:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r5, r1
    mov r4, r2
    bl GetSystemWork
    mov r6, r0
    mov r0, r7
    bl func_020191dc
    sub r1, r0, #0x1
    mov r0, #0x18
    mla r0, r1, r0, r6
    add r1, r0, #0x14
    ldrb r0, [r1, r5]
    add r0, r4, r0
    cmp r0, #0xff
    movgt r0, #0xff
    strgtb r0, [r1, r5]
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r0, #0x0
    movlt r0, #0x0
    strltb r0, [r1, r5]
    strgeb r0, [r1, r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
