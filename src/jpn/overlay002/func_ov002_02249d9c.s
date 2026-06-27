; func_ov002_02249d9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_02253370
        .global func_ov002_02249d9c
        .arm
func_ov002_02249d9c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    rsb r7, r0, #0x1
    mov r6, #0x0
    mov r5, #0xb
.L_cd0:
    add r0, r4, r6, lsl #0x1
    add r0, r0, #0x1d00
    ldrh r2, [r0, #0xa2]
    mov r0, r7
    mov r1, r5
    bl func_ov002_02253370
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_cd0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf08c
