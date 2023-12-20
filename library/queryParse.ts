const PARAMS_RE = /\?(.*)$/;

export const queryParse = <T = {}>(url: string): [string, T] => {
  const object: T = {} as any;

  const execResult = PARAMS_RE.exec(url);

  if (execResult) {
    const [_, params] = execResult;

    for (const rows of params.split('&')) {
      const [key, value] = rows.split('=');
      if (key) {
        (object as any)[key] = decodeURIComponent(value);
      }
    }
  }

  return [url.slice(0, url.length - (execResult?.[0].length ?? 0)), object];
};