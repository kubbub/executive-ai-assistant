from pathlib import Path

import icecream as ic
import yaml

_ROOT = Path(__file__).absolute().parent

ic.ic(_ROOT)


def get_config(config: dict):
    # This loads things either ALL from configurable, or
    # all from the config.yaml
    # This is done intentionally to enforce an "all or nothing" configuration
    if "email" in config["configurable"]:
        return config["configurable"]
    else:
        with open(_ROOT.joinpath("config.yaml")) as stream:
            return yaml.safe_load(stream)
