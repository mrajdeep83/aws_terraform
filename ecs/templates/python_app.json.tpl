[
  {
    "name": "python-app",
    "image": "${docker_image_url_python}",
    "essential": true,
    "cpu": 5,
    "memory": 256,
    "links": [],
    
    "portMappings": [
      {
        "containerPort": 5000,
        "hostPort": 0,
        "protocol": "tcp"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/python-app",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "python-app-log-stream"
      }
    }
  },
  {
    "name": "nginx",
    "image": "${docker_image_url_nginx}",
    "essential": true,
    "cpu": 5,
    "memory": 256,
    "links": ["python-app"],
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 0,
        "protocol": "tcp"
      }
    ],
    "mountPoints": [
      {
        "containerPath": "/usr/src/app/staticfiles/",
        "sourceVolume": "static_volume"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/nginx",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "nginx-log-stream"
      }
    }
  }
]