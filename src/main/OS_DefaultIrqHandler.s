; OS_DefaultIrqHandler (was func_02090570): NitroSDK's no-op default
; interrupt handler — installed as a placeholder in OSi_IrqCallbackTable
; for every IE bit that doesn't have a registered per-interrupt
; callback. 16 of 22 entries in the table point here.
;
;     bx lr
;
; 1 ARM instruction, 0x4 bytes.
;
; Paired with brief 015's OSi_IrqCallbackTable rename (PR #168) — that
; table's default-populated slots are this function. Together they
; establish the NDS IRQ dispatch ground truth.
;
; Ships as .s because `bx lr` alone (no prologue, no return value
; setup) doesn't come out of any C form — the natural empty `void f()
; {}` emits `mov r0, r0; bx lr` or similar placeholder instead, and
; mwcc's -O4 doesn't strip it to a bare `bx lr`.

        .text

        .global OS_DefaultIrqHandler
        .arm
OS_DefaultIrqHandler:
        bx      lr
