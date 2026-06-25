; func_02019150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020191dc
        .global func_02019150
        .arm
func_02019150:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    mov r0, r5
    bl func_020191dc
    sub r1, r0, #0x1
    mov r0, #0x18
    mla r0, r1, r0, r4
    cmp r5, #0x0
    ldreq r0, [r4, #0x8d0]
    moveq r0, r0, lsl #0x1c
    moveq r0, r0, lsr #0x1c
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    ldmia sp!, {r3, r4, r5, pc}
