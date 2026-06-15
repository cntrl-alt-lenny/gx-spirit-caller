; func_02048b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02048bc0
        .extern func_0204918c
        .extern func_02053650
        .global func_02048b08
        .arm
func_02048b08:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r7, r0
    mov r5, r2
    cmp r6, #0x0
    mov r4, #0x0
    ble .L_89c
.L_814:
    mov r0, r4
    bl func_0204918c
    cmp r0, #0x0
    beq .L_890
    cmp r0, r5
    bne .L_890
    mov r0, #0xc
    mla r0, r6, r0, r7
    bl func_02053650
    cmp r0, #0x0
    beq .L_868
    mov r0, #0xc
    mla r0, r4, r0, r7
    bl func_02053650
    cmp r0, #0x0
    bne .L_868
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_02048bc0
    b .L_878
.L_868:
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_02048bc0
.L_878:
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r1, [r1]
    add sp, sp, #0x4
    strb r0, [r1, #0x1d]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_890:
    add r4, r4, #0x1
    cmp r4, r6
    blt .L_814
.L_89c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219dc80
