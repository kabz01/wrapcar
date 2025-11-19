import type React from "react"
import "./globals.css"
import ClientLayout from "./ClientLayout"

export const metadata = {
  title: "M28 Automotives - Premium Car Wraps & Protection",
  description: "Premium Car Wraps, Paint Protection, and More",
  generator: "v0.app",
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return <ClientLayout>{children}</ClientLayout>
}
