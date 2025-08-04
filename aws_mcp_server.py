#!/usr/bin/env python3
import asyncio
from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import Resource, Tool, TextContent

app = Server("aws-docs")

@app.list_resources()
async def list_resources():
    return [
        Resource(uri="aws://ec2", name="EC2", mimeType="text/plain"),
        Resource(uri="aws://s3", name="S3", mimeType="text/plain"),
        Resource(uri="aws://lambda", name="Lambda", mimeType="text/plain")
    ]

@app.read_resource()
async def read_resource(uri: str):
    docs = {
        "aws://ec2": "# EC2\nCompute instances in the cloud",
        "aws://s3": "# S3\nObject storage service", 
        "aws://lambda": "# Lambda\nServerless functions"
    }
    return docs.get(uri, "Not found")

@app.list_tools()
async def list_tools():
    return [Tool(
        name="search",
        description="Search AWS docs",
        inputSchema={
            "type": "object",
            "properties": {"query": {"type": "string"}},
            "required": ["query"]
        }
    )]

@app.call_tool()
async def call_tool(name: str, arguments: dict):
    if name == "search":
        query = arguments["query"]
        return [TextContent(type="text", text=f"Results for '{query}': EC2, S3, Lambda docs")]

async def main():
    async with stdio_server() as (read_stream, write_stream):
        await app.run(read_stream, write_stream, {})

if __name__ == "__main__":
    asyncio.run(main())