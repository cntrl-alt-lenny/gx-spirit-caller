; func_0201c1e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018f80
        .extern func_02018f90
        .extern func_020195ec
        .global func_0201c1e0
        .arm
func_0201c1e0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x14]
    mov r0, r0, lsl #0x18
    mov r6, r0, lsr #0x18
    bl func_020195ec
    mov r5, r0
    bl func_02018f80
    mov r4, r0
    bl func_02018f90
    mov r2, r6
    add r3, r5, #0x2
    mov r1, r0
    mov r0, r4
    .word 0xeb065bc4
    str r0, [r7]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
