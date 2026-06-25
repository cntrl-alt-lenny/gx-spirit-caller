; func_ov002_0228c70c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern func_ov002_022575f0
        .extern func_ov002_0228c474
        .global func_ov002_0228c70c
        .arm
func_ov002_0228c70c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov002_022575f0
    ldr r1, [sp, #0x10]
    ldr ip, _LIT0
    add r1, r1, r6, lsl #0x4
    mov r2, #0x1
    mvn r1, r2, lsl r1
    and r1, r0, r1
    mov r0, r6
    mov r2, r5
    mov r3, r4
    str r6, [ip]
    bl func_ov002_0228c474
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444
