; func_0201d3d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218fddc
        .extern func_02005820
        .extern func_0201cf34
        .extern func_0201d0fc
        .extern func_020203e8
        .extern func_02020418
        .extern func_0209372c
        .global func_0201d3d4
        .arm
func_0201d3d4:
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    bl func_020203e8
    mov r0, #0x0
    bl func_02005820
    bl func_0201cf34
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x14]
    bl func_0201d0fc
    bl func_02020418
    cmp r0, #0x3
    ldmneia sp!, {r3, pc}
.L_3c:
    bl func_0209372c
    bl func_02020418
    cmp r0, #0x3
    beq .L_3c
    ldmia sp!, {r3, pc}
_LIT0: .word data_0218fddc
