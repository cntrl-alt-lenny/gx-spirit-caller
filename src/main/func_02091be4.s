; func_02091be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63c8
        .extern func_02091690
        .extern func_020916c8
        .extern func_0209198c
        .extern func_02091a0c
        .extern func_02092074
        .extern func_02092154
        .extern func_02092700
        .extern func_02093bfc
        .global func_02091be4
        .arm
func_02091be4:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r4, [r0]
    bl func_020916c8
    mov r0, r4
    bl func_02092700
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_b8
    mov r1, r4
    bl func_02092154
.L_b8:
    mov r0, r4
    bl func_02092074
    mov r1, #0x2
    add r0, r4, #0x9c
    str r1, [r4, #0x64]
    bl func_02091a0c
    bl func_02091690
    bl func_0209198c
    bl func_02093bfc
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a63c8
