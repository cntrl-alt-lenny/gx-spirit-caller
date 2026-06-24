; func_02068cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b98
        .extern func_020693e0
        .global func_02068cdc
        .arm
func_02068cdc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r6, r2
    mov r0, r1
    mov r4, r3
    bl func_02054b98
    mov r3, r6, asr #0x8
    mov r2, r6, lsl #0x8
    mov r1, r0
    and r3, r3, #0xff
    and r0, r2, #0xff00
    orr r0, r3, r0
    mov r2, r0, lsl #0x10
    mov r3, r4
    add r0, r5, #0x4c
    mov r2, r2, lsr #0x10
    bl func_020693e0
    ldmia sp!, {r4, r5, r6, pc}
