import User from "@/models/User"
import connectDB from "@/config/db";
import { getAuth } from "@clerk/nextjs/dist/types/server";
import { NextResponse } from "next/server";


export async function GET(request) {
    try {
        const { userId } = getAuth(request)

        await connectDB()
        const user = await User.findById(userId)

        const { cartItems  } = user

        return NextResponse.json( { sucess: true, carItems})

    } catch (error) {
        return NextResponse.json( { sucess: false, message:error.message } );

    }
}