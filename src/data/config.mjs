const config = [
    {
        'replace': '{{blockchain}}',
        'preset': 'githubDetailsCodeCoverage',
        'projects': [
            {
                "title": "triangularPairs",
                "githubUserName": "a6b8",
                "githubRepository": "triangularPairs",
                "githubWorkflowPath": "test-on-release.yml"
            },
            {
                "title": "trackerAPI",
                "githubUserName": "a6b8",
                "githubRepository": "trackerAPI",
                "githubWorkflowPath": "test-on-release.yml"
            },
            {
                "title": "rpcBenchmark",
                "githubUserName": "a6b8",
                "githubRepository": "rpcBenchmark",
                "githubWorkflowPath": "test-on-release.yml"
            }
        ]
    },
    {
        'replace': '{{ai_tools}}',
        'preset': 'githubDetailsCodeCoverage',
        'projects': [
            {
                "title": "flowmcp-core",
                "githubUserName": "FlowMCP",
                "githubRepository": "flowmcp-core",
                "githubWorkflowPath": "test-on-push.yml"
            },
            {
                "title": "get-sheet",
                "githubUserName": "a6b8",
                "githubRepository": "get-sheet",
                "githubWorkflowPath": "test-on-release.yml"
            },
            {
                "title": "get-ui",
                "githubUserName": "a6b8",
                "githubRepository": "get-ui",
                "githubWorkflowPath": "test-on-release.yml"
            },
            {
                "title": "memo-toolkit",
                "githubUserName": "a6b8",
                "githubRepository": "memo-toolkit",
                "githubWorkflowPath": "test-on-release.yml"
            },
            {
                "title": "depwatch",
                "githubUserName": "a6b8",
                "githubRepository": "depwatch",
                "githubWorkflowPath": "test-on-push.yml"
            }
        ]
    }
]

export { config }
