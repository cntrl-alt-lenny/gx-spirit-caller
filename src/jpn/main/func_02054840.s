; func_02054840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffaec
        .extern func_020a9698
        .global func_02054840
        .arm
func_02054840:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, #0x0
    mov r8, r0
    mov r7, r1
    mov r5, r6
    ldr r4, _LIT0
.L_64:
    ldrb r2, [r8, r6]
    mov r1, r4
    add r0, r7, r5
    bl func_020a9698
    add r6, r6, #0x1
    cmp r6, #0x10
    add r5, r5, #0x2
    bcc .L_64
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ffaec
